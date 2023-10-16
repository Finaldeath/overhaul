void main()
{
    object oEnter = GetEnteringObject();
    if(GetRacialType(oEnter) == RACIAL_TYPE_ANIMAL &&
       GetIsObjectValid(GetMaster(oEnter)) == FALSE)
    {
        SignalEvent(oEnter,EventUserDefined(910));
        SetLocalInt(GetModule(),
                    "NW_G_M1S5AnimalsRescued",
                    GetLocalInt(GetModule(),"NW_G_M1S5AnimalsRescued") + 1);
    }
}
