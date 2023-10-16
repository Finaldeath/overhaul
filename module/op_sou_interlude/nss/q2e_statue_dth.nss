// statue death event - destroy related trap if both statues are gone

void main()
{
    string sTrap = "Q2E_TRAP" + GetStringRight(GetTag(OBJECT_SELF), 1);
    object oTrap = GetNearestObjectByTag(sTrap);
    int nStatus = GetLocalInt(oTrap, "ONE_DOWN");
    if(nStatus > 0) // the other statue set it to greater the 0 -> I am the second -> remove the trap
        DestroyObject(oTrap);
    else
        SetLocalInt(oTrap, "ONE_DOWN", 1);
}
