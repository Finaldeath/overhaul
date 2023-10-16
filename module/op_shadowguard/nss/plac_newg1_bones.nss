void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        AssignCommand(oPC, SpeakString("[These seem to be the skeletal remains of whomever the inhabitants of this city once were...]"));
    }
}
