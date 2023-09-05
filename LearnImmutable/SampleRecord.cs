namespace LearnImmutable
{
    public record SampleRecord(string ParamString, int ParamInt, DateTime ParamDate)
    {
        public string? MutableProperty { get; set; }
    }

    
}