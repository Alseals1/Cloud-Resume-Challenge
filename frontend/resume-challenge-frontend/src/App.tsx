import "./App.css"
import About from "./components/About"
import Footer from "./components/Footer"
import Info from "./components/Info"
import Projects from "./components/Projects"
import Skills from "./components/Skills"
import VisitorCounter from "./components/VisitorCounter"

function App() {
  return (
    <div className="min-h-screen bg-gray-50 text-gray-800 p-8">
      <div className="max-w-4xl mx-auto">
        {/* Header with visitor counter */}
        <header className="flex justify-between items-start mb-10">
          <div className="flex-1" />
          <VisitorCounter />
        </header>

        {/* Main content */}
        <main className="space-y-10">
          <Info />
          <About />
          <Skills />
          <Projects />
        </main>

        {/* Footer */}
        <footer className="mt-10">
          <Footer />
        </footer>
      </div>
    </div>
  )
}

export default App
