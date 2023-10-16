void main()
{
    if(GetUserDefinedEventNumber() == 1005 ||
       GetUserDefinedEventNumber() == 1006)
    {
        SetLocalInt(OBJECT_SELF,"M1S3TestSpellCast",FALSE);
    }
}
