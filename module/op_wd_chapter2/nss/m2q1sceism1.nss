//* Urth Alive, Urth Werewolf, Player has ring
int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_URTHCURED") == 0 &&
                GetLocalInt(GetModule(),"NW_G_URTHISDEAD") == 0 &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITRING01"));
    return l_iResult;
}
