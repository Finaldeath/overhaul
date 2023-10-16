void main()
{
    // If one of the zoo animals has been dominated,
    // they we'll increase the rescued number when
    // they enter the grove. As the trigger wont
    // catch them for a variety of possible reasons.
    object oEnter = GetEnteringObject();
    if(GetRacialType(oEnter) == RACIAL_TYPE_ANIMAL &&
       GetIsObjectValid(GetMaster(oEnter)) == TRUE)
    {
        if ( GetTag( oEnter ) == "M1S5AWolf" ||
             GetTag( oEnter ) == "M1S5APanther" ||
             GetTag( oEnter ) == "M1S5ALion" ||
             GetTag( oEnter ) == "M1S5ABear1" )
        {
            SignalEvent(oEnter,EventUserDefined(910));
            SetLocalInt(GetModule(),
                        "NW_G_M1S5AnimalsRescued",
                        GetLocalInt(GetModule(),"NW_G_M1S5AnimalsRescued") + 1);
        }
    }
}
