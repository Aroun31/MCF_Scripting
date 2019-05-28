using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;

namespace MCF___AppsReboot
{
    public partial class Form1 : Form
    {
        Int32 heure;
        Int32 minute;
        int resultat;
        bool valideShutdown;
        string msg;
        int newHeure;
        int newMinute;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DateTime actualDate = DateTime.Now;
            string[] split = actualDate.ToString().Split(new Char[] { ' ', '/' });
            string actualHeure = split[3];
            string[] NewSplit = actualHeure.Split(':');
            newHeure = Convert.ToInt32(NewSplit[0]);
            newMinute = Convert.ToInt32(NewSplit[1]);
            valideShutdown = true;
            msg = "Opération validé !\nMerci d'avoir urilisé :\nMCF - AppsRebbot";

            if (EditHeure.Text.Trim() != "")
            {
                heure = Convert.ToInt32(EditHeure.Text.Trim());
            }
            if (EditMinute.Text.Trim() != "")
            {
                minute = Convert.ToInt32(EditMinute.Text.Trim());
            }

            if (minute != 0)
            {
                if (minute >= 60)
                {
                    valideShutdown = false;
                    msg = "Opération impossible !\nMerci de renseigner les minutes entre 0 et 59";
                }
                else
                {
                    newMinute += minute;
                    if (newMinute > 60)
                    {
                        newHeure ++;
                        newMinute = newMinute -= 60;
                    }
                    minute = minute * 60;
                }
            }

            if (heure != 0)
            {
                newHeure += heure;
                heure = heure * 60;
                heure = heure * 60;
            }

            MessageBox.Show(msg, "MCF - AppsRebbot");
            if (valideShutdown)
            {
                resultat = heure + minute;
                string heureShutdown = "Arrêt à : \n" + newHeure + "H" + newMinute + "Min";
                label5.Text = heureShutdown;
                Process.Start("shutdown", "/s /t " + resultat);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (valideShutdown)
            {
                Process.Start("shutdown", "/a");
                MessageBox.Show("Vous venez d'annuler l'arrêt programmé.");
                valideShutdown = false;
            }
            else
            {
                MessageBox.Show("Aucun arrêt programmé n'est en cours");
            }

        }
    }
}
