import "./App.css"
import About from "./components/About"
import Footer from "./components/Footer"
import Info from "./components/Info"
import Projects from "./components/Projects"
import Skills from "./components/Skills"
import VisitorCounter from "./components/VisitorCounter"

function App() {
   return (
    <>
    <div className="min-h-screen bg-gray-50 text-gray-800 p-8">
  <div className="max-w-4xl mx-auto space-y-10 relative">
    <div className="absolute top-0 right-0">
      <VisitorCounter />
    </div>

    <Info />
    <About />
    <Skills />
    <Projects />
    <Footer />
  </div>
</div>
    </>
  )
}

export default App
