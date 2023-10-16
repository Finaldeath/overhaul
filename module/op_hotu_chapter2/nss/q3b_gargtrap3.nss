// Destroys trap when both gargs are down

void main()
{
    SetLocalInt(OBJECT_SELF, "DEAD", 1);
    object oTrap = GetNearestObjectByTag("q3_gargtrap3");
    int nCount = GetLocalInt(oTrap, "COUNT");
    nCount++;
    SetLocalInt(oTrap, "COUNT", nCount);
    if(nCount == 2)
        DestroyObject(oTrap);
}
