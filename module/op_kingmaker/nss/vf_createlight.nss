void main()
{
    object oPC = GetPCSpeaker();
    location lSpawn = GetLocation(oPC);

    object oMW = CreateObject(OBJECT_TYPE_PLACEABLE, "km_deathlight", lSpawn);
}
