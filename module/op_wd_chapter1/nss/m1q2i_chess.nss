void main()
{
    int nNth = 1;
    string sTrap = "TRAP_" + GetTag(OBJECT_SELF);
    object oTrap = GetNearestObjectByTag(sTrap,OBJECT_SELF,nNth);
    while(GetIsObjectValid(oTrap))
    {
        DestroyObject(oTrap);
        nNth++;
        oTrap = GetNearestObjectByTag(sTrap,OBJECT_SELF,nNth);
    }
}
