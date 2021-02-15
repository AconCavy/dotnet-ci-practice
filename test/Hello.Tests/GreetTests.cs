using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Hello.Tests
{
    [TestClass]
    public class GreetTests
    {
        [TestMethod]
        public void HelloTest()
        {
            var greet = new Greet();
            Assert.AreEqual("Hello World!", greet.Hello());
        }
    }
}