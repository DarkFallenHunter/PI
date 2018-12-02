import sys
import vtk
from PyQt5 import QtCore, QtGui, QtWidgets

from vtk.qt.QVTKRenderWindowInteractor import QVTKRenderWindowInteractor


class UiViewModelWindow(QtWidgets.QMainWindow):
    def setupUi(self, view_model_window):
        self.setObjectName("view_model_window")
        self.resize(751, 561)
        self.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.frame = QtWidgets.QFrame(view_model_window)
        self.frame.setGeometry(QtCore.QRect(19, 19, 721, 531))
        self.frame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.frame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.frame.setObjectName("frame")

    def __init__(self, filename, parent=None):
        QtWidgets.QMainWindow.__init__(self, parent)
        self.setupUi(self)
        self.vl = QtWidgets.QVBoxLayout()
        self.vtkWidget = QVTKRenderWindowInteractor(self.frame)
        self.vl.addWidget(self.vtkWidget)

        reader = vtk.vtkSTLReader()
        reader.SetFileName(filename)

        mapper = vtk.vtkPolyDataMapper()
        if vtk.VTK_MAJOR_VERSION <= 5:
            mapper.SetInput(reader.GetOutput())
        else:
            mapper.SetInputConnection(reader.GetOutputPort())

        actor = vtk.vtkActor()
        actor.SetMapper(mapper)

        self.ren = vtk.vtkRenderer()
        self.vtkWidget.GetRenderWindow().AddRenderer(self.ren)
        self.iren = self.vtkWidget.GetRenderWindow().GetInteractor()

        self.ren.AddActor(actor)

        self.ren.ResetCamera()

        self.frame.setLayout(self.vl)
        self.setCentralWidget(self.frame)

        self.show()
        self.iren.Initialize()
        self.iren.Start()


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    view_model_window = QtWidgets.QWidget()
    ui = UiViewModelWindow('..\\..\\3d\\Airplane without texture.stl')
    sys.exit(app.exec_())
