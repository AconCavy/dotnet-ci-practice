using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Hello.Tests
{
    [TestClass]
    public class Class1Tests
    {
        [TestMethod]
        public void HelloTest()
        {
            var class1 = new Class1();
            Assert.AreEqual("Hello World!", class1.Hello());
        }
    }
}