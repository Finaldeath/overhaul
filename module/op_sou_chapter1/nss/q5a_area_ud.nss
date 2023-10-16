//::///////////////////////////////////////////////
//:: Kobold Caves area ud event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Whenever receiving event 101 - Lower platform and raise boulder.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 18/2/2003
//:://////////////////////////////////////////////

void CreateKobold(location lLoc)
{
    object oKobold = CreateObject(OBJECT_TYPE_CREATURE, "q5_kobold_jumper", lLoc);
    SetLocalInt(oKobold, "PLAY", 1);
}

void main()
{
    int MAX_LOWER_PLATFORM = 7; // maximum number of times to move the lift
    float PLATFORM_MOVE_INTERVAL = 0.3;
    float BOULDER_MOVE_INTERVAL = 0.6;
    object oBoulder = GetObjectByTag("Q5A_BOULDER");
    object oChain1 = GetObjectByTag("Q5A_CHAIN1");
    object oChain2 = GetObjectByTag("Q5A_CHAIN2");
    object oPlatform = GetObjectByTag("Q5A_PLATFORM");

    effect eSmoke = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_NATURE);
    string sSmoker = "plc_spdcocoon";
    effect eDam = EffectDamage(1000);

    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // lower platform - can happen up to MAX_LOWER_PLATFORM times
    {
        int nTimes = GetLocalInt(OBJECT_SELF, "Q5A_TIMES_USED");
        if(nTimes > MAX_LOWER_PLATFORM)
            return;
        nTimes++;
        SetLocalInt(OBJECT_SELF, "Q5A_TIMES_USED", nTimes);
        object oSmoker1 = CreateObject(OBJECT_TYPE_PLACEABLE, sSmoker, GetLocation(oBoulder));
        object oSmoker2 = CreateObject(OBJECT_TYPE_PLACEABLE, sSmoker, GetLocation(oPlatform));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oSmoker1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oSmoker2);

        vector vBoulder = GetPosition(oBoulder);
        vBoulder.z += BOULDER_MOVE_INTERVAL;

        vector vChain1 = GetPosition(oChain1);
        vChain1.z -= PLATFORM_MOVE_INTERVAL;

        vector vChain2 = GetPosition(oChain2);
        vChain2.z += PLATFORM_MOVE_INTERVAL;

        vector vPlatform = GetPosition(oPlatform);
        vPlatform.z -= PLATFORM_MOVE_INTERVAL;

        location lBoulder = Location(OBJECT_SELF, vBoulder, GetFacingFromLocation(GetLocation(oBoulder)));
        location lChain1 = Location(OBJECT_SELF, vChain1, 0.0);
        location lChain2 = Location(OBJECT_SELF, vChain2, 0.0);
        location lPlatform = Location(OBJECT_SELF, vPlatform, 0.0);

        DestroyObject(oBoulder);
        DestroyObject(oChain1);
        DestroyObject(oChain2);
        DestroyObject(oPlatform);

        object oWaypoint = GetObjectByTag("Q5A_WP_PLATFORM");
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oWaypoint);
        //Play bucket dropping sound
        AssignCommand(oPC, PlaySound("as_sw_pulybucket"));


        CreateObject(OBJECT_TYPE_PLACEABLE, "q5a_boulder", lBoulder);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5a_chain1", lChain1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5a_chain2", lChain2);

        if(nTimes == MAX_LOWER_PLATFORM)
        {
            SetLocalLocation(OBJECT_SELF, "lMaxLowerPlatform", lPlatform);
            effect eVis = EffectVisualEffect(358);
            ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPlatform);
            if (GetLocalInt(OBJECT_SELF, "Q5_LEVERUSED") != 1)
            {
                DelayCommand(2.0, CreateKobold(lChain1));
            }
        }
        else
            CreateObject(OBJECT_TYPE_PLACEABLE, "q5a_platform", lPlatform);

     }

}
