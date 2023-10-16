//* Water Elemental will free the trapped wizard
void main()
{
    DestroyObject(GetObjectByTag("M3Q3B_PRISON_BEAM_01"));
    DestroyObject(GetObjectByTag("M3Q3B_PRISON_BEAM_02"));
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC,"NW_L_NaxTalk")==1 || GetLocalInt(oPC,"NW_L_NaxTalk")==2)
    {
        SetLocalInt(oPC,"NW_L_NaxTalk",99);
    }
    /////////Also teleport Nax to right beside the player
    object oNax = GetObjectByTag("Nax");
    object oWay = GetObjectByTag("M3Q3_NAX_JUMP_TO");
    location lWay = GetLocation(oWay);
    AssignCommand(oNax, JumpToObject(oWay));
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    DelayCommand(0.2, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lWay));
    DelayCommand(3.0,AssignCommand(oNax,ActionStartConversation(oPC)));
    DestroyObject(OBJECT_SELF,4.0);
}
