// * keeps the dragon body around
void main()
{
    SetIsDestroyable(FALSE, FALSE, FALSE);
    object oKiller = GetLastKiller();
    // * if a henchman did the killing, give the master the journal entry
    object oMaster = GetMaster(GetLastKiller());
    if (GetIsObjectValid(oMaster) == TRUE)
    {
      oKiller = oMaster;
    }
    // * creates the keys
    CreateItemOnObject("M4DragonKey", oKiller);
}
