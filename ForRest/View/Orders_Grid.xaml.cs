﻿using ForRest.Controls;
using ForRest.Model;
using ForRest.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace ForRest.View
{    
    public partial class Orders_Grid : Page
    {
        public Orders_Grid()
        {
            InitializeComponent();
            this.DataContext = new MainViewModel();
        }

        private void Refresh_Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Refresh();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Uri("View/Order_detailss.xaml", UriKind.Relative));
        }
    }
}
