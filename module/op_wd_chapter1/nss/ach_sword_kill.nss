void main()
{
    object oKiller = GetLastKiller();
    int iKillerLVL;
    int iSwordCount;

    iKillerLVL = GetLevelByPosition(1, oKiller) + GetLevelByPosition(2, oKiller) + GetLevelByPosition(3, oKiller);
    if(iKillerLVL <= 20){
        iSwordCount = GetLocalInt(GetModule(), "blake_flying_swords");
        SetLocalInt(GetModule(), "blake_flying_swords", iSwordCount + 1);
    }
}
