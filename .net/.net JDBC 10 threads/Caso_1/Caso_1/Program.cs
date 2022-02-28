using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Caso_1
{
    internal class Program
    {
        private static ArrayList cantones = new ArrayList();
        
        static void Main(string[] args)
        {
            //=============CONSULTA 1===================
            //cantones para los 10 threads
            cantones.Add("Zaozerne");
            cantones.Add("Göteborg");
            cantones.Add("Tiantai Chengguanzhe");
            cantones.Add("Sanandaj");
            cantones.Add("Guangang");
            cantones.Add("Muzaffargarh");
            cantones.Add("Ubá");
            cantones.Add("Ichihara");
            cantones.Add("Kokubunji");
            cantones.Add("Zaozerne");
            Thread[] threadList = new Thread[10];
            var stopwatch = Stopwatch.StartNew();
            for (int i = 0; i < 10; i++)
            {
                Consulta_1 consulta_1 = new Consulta_1(cantones[i].ToString());
                //se crea un thread y se guarda en una lista para poder tomar el tiempo de ejecución
                threadList[i] = new Thread(consulta_1.run);
                threadList[i].Start();
            }
            for (int i = 0; i < threadList.Length; i++)
            {
                //esto hace que se tenga que esperar a que todos los threads terminen de ejecutarse
                threadList[i].Join();
            }
            Console.WriteLine("Tiempo de consulta 1: {0} ms", stopwatch.ElapsedMilliseconds);

            //=============CONSULTA 2===================
            Consulta_2 consulta_2 = new Consulta_2();
            var events = new ManualResetEvent[10];//lista de eventos para llevar el control de los threads
            var list = new List<int>();
            //se le asignan los maximos y minimos al pool
            ThreadPool.SetMinThreads(2, 5);
            ThreadPool.SetMaxThreads(5, 10);
            stopwatch = Stopwatch.StartNew();
            for (int i = 0; i < 10; i++)
            {
                list.Add(i);
                events[i] = new ManualResetEvent(false);
                int j = i;
                //se llama al pool y se le da un trabajo a un thread
                ThreadPool.QueueUserWorkItem(x =>
                {
                    consulta_2.run(i);
                    events[j].Set();
                }, list[i]);
            }
            //se espera a que todos los eventos finalicen para tomar el tiempo de ejecucion
            WaitHandle.WaitAll(events);
            Console.WriteLine("Tiempo de consulta 2: {0} ms", stopwatch.ElapsedMilliseconds);
        }
    }
}
