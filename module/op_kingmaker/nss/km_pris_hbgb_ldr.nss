void main()
{
    object oPC = GetEnteringObject();
    object oTask;
    object oMap = GetObjectByTag("q2c24c_way_rocks");
    int iGoblin = GetLocalInt(GetModule(), "PRIS_HOBGOBLEADER");
    SetMapPinEnabled(oMap,1);

    if ((GetIsPC(oPC)) && (iGoblin == FALSE))
    {
        SetLocalInt(GetModule(), "PRIS_HOBGOBLEADER", TRUE);
        oTask = CreateObject(OBJECT_TYPE_CREATURE,
                "q2c24c_hobgoblin", GetLocation(oMap));
    }
}
