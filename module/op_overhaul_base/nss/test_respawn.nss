void Respawn(string sResRef, int nObjectType, location lTarget, string sRespawnScript)
{
    object oObject = CreateObject(nObjectType, sResRef, lTarget);

    // Very lazy
    int n;
    for (n = 0; n <= 20000; n++)
    {
        SetEventScript(oObject, n, "");
    }
    SetEventScript(oObject, EVENT_SCRIPT_CREATURE_ON_DEATH, sRespawnScript);
    SetEventScript(oObject, EVENT_SCRIPT_DOOR_ON_DEATH, sRespawnScript);
    SetEventScript(oObject, EVENT_SCRIPT_PLACEABLE_ON_DEATH, sRespawnScript);
}

void main()
{
    object oModule = GetModule();
    string sResRef = GetResRef(OBJECT_SELF);
    int nType = GetObjectType(OBJECT_SELF);
    location lTarget = GetLocation(OBJECT_SELF);
    AssignCommand(oModule, DelayCommand(3.0, Respawn(sResRef, nType, lTarget, GetScriptName())));

}
