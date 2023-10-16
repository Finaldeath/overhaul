//Have Glendir speak a one liner when PC crosses trigger
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        object oGlendil = GetObjectByTag("Q3_GLENDIL");
        AssignCommand(oGlendil, SpeakStringByStrRef(40284));
        DestroyObject(OBJECT_SELF);

    }

}
