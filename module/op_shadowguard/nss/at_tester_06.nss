void main()
{
    int n = GetLocalInt(GetModule(), "N_MODULE_STAGE");

    n--;

    SetLocalInt(GetModule(), "N_MODULE_STAGE", n);

    AssignCommand(OBJECT_SELF, SpeakString("Mod stage set to : " + IntToString(n)));
}
