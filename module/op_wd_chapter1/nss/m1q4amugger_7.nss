void main()
{
    if(Random(3) == 0)
    {
        CreateItemOnObject("M1Q04IAUCTION");
    }
    if(Random(2) == 0)
    {
        CreateItemOnObject("M1Q04ISMUGCOIN",OBJECT_SELF,Random(2) + 1);
    }
}
