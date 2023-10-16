// Each pull of the lever changes the number in front of it

// Create a line between vertices n1 and n2 of for the number determined by sType
void CreateLine(int n1, int n2, string sType)
{
    string sTag1 = "q4b_vertex_" + sType + IntToString(n1);
    string sTag2 = "q4b_vertex_" + sType + IntToString(n2);

    object oV1 = GetObjectByTag(sTag1);
    object oV2 = GetObjectByTag(sTag2);

    effect eBeam = EffectBeam(VFX_BEAM_SILENT_HOLY, oV1, BODY_NODE_CHEST);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oV2));
}

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

// Deletes all current lines from number sType
void InitLines(string sType)
{
    int i;
    string sTag;
    object oV;
    for(i = 1; i <= 6; i++)
    {
        sTag = "q4b_vertex_" + sType + IntToString(i);
        oV = GetObjectByTag(sTag);
        RemoveEffects(oV);
    }
}

void main()
{
    // First making sure the lever is not in the middle of initializing
    int nActive = GetLocalInt(OBJECT_SELF, "INIT_ACTIVE");
    if(nActive == 1)
        return;
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 5.0);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 5.0);
    SetLocalInt(OBJECT_SELF, "INIT_ACTIVE", 1);
    DelayCommand(1.0, SetLocalInt(OBJECT_SELF, "INIT_ACTIVE", 0));
    AssignCommand(GetLastUsedBy(), PlaySound("sim_mentconf"));
    // Determine right(A) or left(B) lever:
    string sType = GetStringRight(GetTag(OBJECT_SELF), 1);
    int nCurrentNumber = GetLocalInt(OBJECT_SELF, "NUMBER");
    if(nCurrentNumber == 10)
        nCurrentNumber = 0;
    InitLines(sType);
    if(nCurrentNumber == 0)
    {
        CreateLine(5, 6, sType);
        CreateLine(1, 2, sType);
        CreateLine(3, 5, sType);
        CreateLine(4, 6, sType);
        CreateLine(1, 3, sType);
        CreateLine(2, 4, sType);
    }
    else if(nCurrentNumber == 1)
    {
        CreateLine(4, 6, sType);
        CreateLine(2, 4, sType);
    }
    else if(nCurrentNumber == 2)
    {
        CreateLine(5, 6, sType);
        CreateLine(4, 6, sType);
        CreateLine(3, 4, sType);
        CreateLine(1, 3, sType);
        CreateLine(1, 2, sType);
    }
    else if(nCurrentNumber == 3)
    {
        CreateLine(5, 6, sType);
        CreateLine(4, 6, sType);
        CreateLine(3, 4, sType);
        CreateLine(2, 4, sType);
        CreateLine(1, 2, sType);
    }
    else if(nCurrentNumber == 4)
    {
        CreateLine(3, 5, sType);
        CreateLine(3, 4, sType);
        CreateLine(4, 6, sType);
        CreateLine(2, 4, sType);
    }
    else if(nCurrentNumber == 5)
    {
        CreateLine(5, 6, sType);
        CreateLine(3, 5, sType);
        CreateLine(3, 4, sType);
        CreateLine(2, 4, sType);
        CreateLine(1, 2, sType);
    }
    else if(nCurrentNumber == 6)
    {
        CreateLine(5, 6, sType);
        CreateLine(3, 5, sType);
        CreateLine(1, 3, sType);
        CreateLine(1, 2, sType);
        CreateLine(2, 4, sType);
        CreateLine(3, 4, sType);
    }
    else if(nCurrentNumber == 7)
    {
        CreateLine(5, 6, sType);
        CreateLine(4, 6, sType);
        CreateLine(2, 4, sType);
    }
    else if(nCurrentNumber == 8)
    {
        CreateLine(5, 6, sType);
        CreateLine(3, 4, sType);
        CreateLine(1, 2, sType);
        CreateLine(3, 5, sType);
        CreateLine(4, 6, sType);
        CreateLine(1, 3, sType);
        CreateLine(2, 4, sType);
    }
    else if(nCurrentNumber == 9)
    {
        CreateLine(5, 6, sType);
        CreateLine(3, 5, sType);
        CreateLine(3, 4, sType);
        CreateLine(4, 6, sType);
        CreateLine(2, 4, sType);
    }
    nCurrentNumber++;
    SetLocalInt(OBJECT_SELF, "NUMBER", nCurrentNumber);


}
