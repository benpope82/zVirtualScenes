﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using zvs.Entities;


namespace zvs.WPF.JavaScript
{
    /// <summary>
    /// Interaction logic for JSTriggerEditorWindow.xaml
    /// </summary>
    public partial class JavaScriptEditorWindow : Window
    {

        private zvsContext Context;
        private JavaScriptCommand Command;
        public bool Canceled = true;
        private ObservableCollection<JSResult> Results = new ObservableCollection<JSResult>();

        private bool _isRunning = false;
        private bool isRunning
        {
            get { return _isRunning; }
            set
            {
                this.Dispatcher.Invoke(() =>
                {
                    TestBtn.IsEnabled = !value;
                });
                _isRunning = value;
            }
        }


        public JavaScriptEditorWindow(zvsContext context, JavaScriptCommand command)
        {
            if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            {
                this.Context = context;
                this.Command = command;
                InitializeComponent();
            }
        }

        ~JavaScriptEditorWindow()
        {
            Debug.WriteLine("TriggerEditorWindow Deconstructed.");
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            if (Command.Script != null)
                TriggerScriptEditor.Editor.AppendText(Command.Script);

            CmdNameTxtBx.Text = Command.Name;
            System.Windows.Data.CollectionViewSource jSResultViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("jSResultViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            jSResultViewSource.Source = Results;
        }

    

        private void Run()
        {
            Results.Clear();
            string script = TriggerScriptEditor.Editor.Text;
            if (!string.IsNullOrEmpty(script))
            {
                BackgroundWorker bw = new BackgroundWorker();
                bw.DoWork += (s, a) =>
                {
                    isRunning = true;
                    SetFeedBackText("Executing JavaScript...");

                    zvs.Processor.JavaScriptExecuter jse = new Processor.JavaScriptExecuter();
                    jse.onComplete += (sender, args) =>
                    {
                        isRunning = false;
                        SetFeedBackText(string.Format("JavaScript executed {0} errors. {1}", args.Errors ? "with" : "without", args.Details));
                    };
                    jse.onReportProgress+= (sender, args) =>
                    {
                        SetFeedBackText(args.Progress);
                    };
                    jse.ExecuteScript(script, Context, "Test Button");
                };
                bw.RunWorkerAsync();
            }
        }

        public void SetFeedBackText(string Text)
        {
            this.Dispatcher.Invoke(() =>
                {
                    Results.Add(new JSResult() { Description = Text });
                });
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void OKBtn_Click(object sender, RoutedEventArgs e)
        {
            Command.Name = CmdNameTxtBx.Text;
            Command.Script = TriggerScriptEditor.Editor.Text;
            Canceled = false;
            this.Close();
        }

        private void TestBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!isRunning)
                Run();
        }

        private void Image_MouseUp_1(object sender, MouseButtonEventArgs e)
        {
            var script = "RunScene('All On');\n";
            TriggerScriptEditor.Editor.InsertText(script);   
        }

        private void Image_MouseUp_2(object sender, MouseButtonEventArgs e)
        {
            var script = "RunDeviceCommand('Office Light','Set Level', '99');\n";
            TriggerScriptEditor.Editor.InsertText(script);
        }

        private void Image_MouseUp_3(object sender, MouseButtonEventArgs e)
        {
            var script = "RunDeviceCommand(1,'Set Level', '99');\n";
            TriggerScriptEditor.Editor.InsertText(script);
        }

        private void Image_MouseUp_4(object sender, MouseButtonEventArgs e)
        {
            var script = "Delay(\"RunDeviceCommand('Office Light','Set Level', '99');\", 3000)\n";
            TriggerScriptEditor.Editor.InsertText(script);
        }

        private void TriggerScriptEditor_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.F5)
            {
                TestBtn_Click(TestBtn, null);
            }
            if (e.Key == Key.Escape)
            {
                CancelBtn_Click(null, null);
            }
        }
    }
}