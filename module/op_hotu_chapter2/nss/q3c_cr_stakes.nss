// Create wooden stakes when destroying a wooden placeable

void main()
{
    int nNumOfStakes = Random(3) + 1 ;
    int i;
    for(i = 1; i <= nNumOfStakes; i++)
    {
        CreateObject(OBJECT_TYPE_ITEM, "q3_woodstake", GetLocation(OBJECT_SELF));
        //CreateItemOnObject("woodenstake", OBJECT_SELF);
    }
}
