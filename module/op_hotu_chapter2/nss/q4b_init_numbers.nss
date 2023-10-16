// Init numbers to prevent strange beams drawing problems...


void CreateLine(int n1, int n2, string sType)
{
    string sTag1 = "q4b_vertex_" + sType + IntToString(n1);
    string sTag2 = "q4b_vertex_" + sType + IntToString(n2);

    object oV1 = GetObjectByTag(sTag1);
    object oV2 = GetObjectByTag(sTag2);

    effect eBeam = EffectBeam(VFX_BEAM_SILENT_HOLY, oV1, BODY_NODE_CHEST);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oV2));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    object oLever1 = GetNearestObjectByTag("q4b_Lever_a");
    object oLever2 = GetNearestObjectByTag("q4b_Lever_b");

    SetLocalInt(oLever1, "NUMBER", 1);
    SetLocalInt(oLever2, "NUMBER", 1);

    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));

    // Create zero for each lever:
    CreateLine(5, 6, "a");
    CreateLine(1, 2, "a");
    CreateLine(3, 5, "a");
    CreateLine(4, 6, "a");
    CreateLine(1, 3, "a");
    CreateLine(2, 4, "a");


    CreateLine(5, 6, "b");
    CreateLine(1, 2, "b");
    CreateLine(3, 5, "b");
    CreateLine(4, 6, "b");
    CreateLine(1, 3, "b");
    CreateLine(2, 4, "b");

}
