namespace LearnImmutableTest
{
    [TestClass]
    public class SampleRecordTest
    {

        SampleRecord record1 = null;
        [TestInitialize]
        public void TestSetup()
        {
            record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5));
        }

        [TestMethod]
        public void TestRecordTypeEqualityWithPositionParameters()
        {//arrange
            SampleRecord record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5));
            SampleRecord record2 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5));

            //assert
            Assert.AreEqual(record1, record2);
            Assert.AreNotSame(record1, record2);
        }
        [TestMethod]
        public void TestRecordInEqualityWithPositionParameters()
        {//arrange
            SampleRecord record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5));
            SampleRecord record2 = new SampleRecord(ParamString: "Test", ParamInt: 2, ParamDate: new DateTime(2023, 9, 5));

            //assert
            Assert.AreNotEqual(record1, record2);
            Assert.AreNotSame(record1, record2);
        }
        [TestMethod]
        public void TestRecordTypeSamenessWithPositionParameters()
        {//arrange
            SampleRecord record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5));
            SampleRecord record2 = record1;

            //assert
            Assert.AreEqual(record1, record2);
            Assert.AreSame(record1, record2);
        }
        [TestMethod]
        public void TestRecordTypeAutoImplementedProperties()
        {
            //arrange
            SampleRecord record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5));

            //Assert
            Assert.AreEqual("Test", record1.ParamString);
            Assert.AreEqual(1, record1.ParamInt);
            Assert.AreEqual(new DateTime(2023, 9, 5), record1.ParamDate);
        }
        [TestMethod]
        public void TestRecordTypeCanHaveMutableProperties()
        {
            //arrange
            string expected = "NewString";

            SampleRecord record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5)) { MutableProperty = "InitialString" };

            //Act
            record1.MutableProperty = expected;

            //Assert

            Assert.AreEqual(record1.MutableProperty, expected);

        }
        [TestMethod]
        public void TestRecordTypeHaveDestructMethodWithoutParam()
        {
            //arrange
            SampleRecord record1 = new SampleRecord(ParamString: "Test", ParamInt: 1, ParamDate: new DateTime(2023, 9, 5)) { MutableProperty = "InitialString" };
            string outString = String.Empty;
            int outInt = 0;
            DateTime outDateTime = new DateTime();

            //Act
            record1.Deconstruct(out outString, out outInt, out outDateTime);

            //Assert
            Assert.AreEqual(outString, "Test");
            Assert.AreEqual(outInt, 1);
            Assert.AreEqual(outDateTime, new DateTime(2023, 9, 5));

        }
        [TestMethod]
        public void TestRecordTypeTestNonDestructiveMutation()
        {
            //Arrange

            //Act
            SampleRecord record2 = record1 with { ParamInt = 2 };
            //Assert
            Assert.AreNotEqual(record1, record2);
            Assert.AreNotSame(record1, record2);
            Assert.AreEqual(record2.ParamInt, 2);
            Assert.AreEqual(record1.ParamInt, 1);
            Assert.AreEqual(record2.ParamString, "Test");
        }
    }
}