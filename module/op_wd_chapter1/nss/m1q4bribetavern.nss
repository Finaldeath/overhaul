void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_TriedBribe") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_TriedBribe",10);
    }
}
