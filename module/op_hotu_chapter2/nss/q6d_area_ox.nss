// Wizard tower any level on-enter
// - Activate wild-magic zone

#include "x2_inc_switches"

// if the players enters again after seeing the apprentice than kill him and
// remove the shard from him.
void HandleLevel3()
{
    object oJansil = GetObjectByTag("q6_jansil");

    if(oJansil == OBJECT_INVALID || GetIsDead(oJansil) || GetLocalInt(oJansil, "GAVE_SHARD_TO_PC") == 1)
        return;

    if(GetLocalInt(oJansil, "FIGHT_STARTED") == 0)
        return;

    object oWP = GetWaypointByTag("q6d_wp_jansil_death");
    AssignCommand(oJansil, JumpToObject(oWP));

    SetLocalInt(OBJECT_SELF, "SHARD_TAKEN", 1);
    // if the player enters the area again, then kill jansil and put a few drow bodies
    object Elemental1 = GetNearestObjectByTag("NW_FIREHUGE", oJansil, 1);
    object Elemental2 = GetNearestObjectByTag("NW_FIREHUGE", oJansil, 2);
    object Elemental3 = GetNearestObjectByTag("NW_FIREHUGE", oJansil, 3);
    DestroyObject(Elemental1);
    DestroyObject(Elemental2);
    DestroyObject(Elemental3);

    object oShard = GetItemPossessedBy(oJansil, "q6_shard");
    DestroyObject(oShard);
    SetImmortal(oJansil, FALSE);
    CreateObject(OBJECT_TYPE_TRIGGER, "q6_trig_body", GetLocation(oJansil));

    // update the number of shards that Sabal has got:
    int nTotalShards = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    nTotalShards++;
    SetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM", nTotalShards);

    int nSabalNum = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    int nPCNum = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
    if(nSabalNum + nPCNum == 5)
        AddJournalQuestEntry("q6_mainquest", 50, GetFirstPC());

    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(oJansil));
    effect eDeath = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oJansil);
    int i = 1;
    oWP = GetNearestObjectByTag("q6d_wp_drow_body", oJansil, i);
    while(oWP != OBJECT_INVALID)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "q6_DrowBody", GetLocation(oWP));
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(oWP));
        i++;
        oWP = GetNearestObjectByTag("q6d_wp_drow_body", oJansil, i);
    }

}


void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPC(oPC))
        return;

    if(GetTag(OBJECT_SELF) == "q6d_wizard_tower3")
        HandleLevel3();


    DeleteLocalString(GetModule(),MODULE_VAR_OVERRIDE_SPELLSCRIPT);

}
