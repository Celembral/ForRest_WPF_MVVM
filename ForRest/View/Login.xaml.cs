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
using ForRest.ViewModel;
using System.Threading;

namespace ForRest.View
{

    public partial class Login : Page
    {
        public Login()
        {
            InitializeComponent();
            this.DataContext = new MainViewModel();
        }

        private void btn_login_Click(object sender, RoutedEventArgs e)
        {
        }

        private void btn_logout_Click(object sender, RoutedEventArgs e)
        {
        }

       

       
    }
}
