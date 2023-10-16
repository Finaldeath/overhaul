int StartingConditional()
{
    object oPlayer = GetLocalObject(GetModule(),"NW_G_M1Q5Returnee");
    int bCondition = GetIsObjectValid(oPlayer) &&
                     GetPCSpeaker() == oPlayer;
    return bCondition;
}
