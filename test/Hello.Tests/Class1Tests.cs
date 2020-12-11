using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Hello.Tests
{
    [TestClass]
    public class Class1Tests
    {
        [TestMethod]
        public void PassTest()
        {
            Assert.IsTrue(true);
        }

        [TestMethod]
        public void FailTest()
        {
            Assert.Fail();
        }
    }
}