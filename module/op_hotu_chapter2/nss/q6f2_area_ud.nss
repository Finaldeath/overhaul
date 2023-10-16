// Throne room user defined events:
// - Jump player to cave when Sabal dies.
// - Remove any planar bindings in any of the none-accessible areas.
// - Remove priest's disease.
// - Revive dead henchmen and jump ALL henchmen near the player
// - place dropped items in divination pool

#include "x0_inc_portal"
#include "nw_i0_plot"

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

int IsInInvalidArea(object oAnchor)
{
    string sTag = GetTag(GetArea(oAnchor));
    return sTag == "q6_NorthernCavern" ||
           sTag == "q6_ShaorisCave" ||
           sTag == "q6_Library" ||
           sTag == "q6e_ShaorisFellTemple" ||
           sTag == "q6f2_ThroneRoom" ||
           sTag == "q6d_wizard_tower1" ||
           sTag == "q6d_wizard_tower2" ||
           sTag == "q6d_wizard_tower3" ||
           sTag == "q6_Castle";
}

void JumpObjectsInArea(object oArea, location lLoc, object oPC)
{
    object oDivPool = GetObjectByTag("LostItems");
    effect eRes = EffectResurrection();
    object oObject = GetFirstObjectInArea(oArea);
    while(oObject != OBJECT_INVALID)
    {
        if(GetObjectType(oObject) == OBJECT_TYPE_CREATURE && GetStringLeft(GetTag(oObject), 6) == "x2_hen")
        {
            if(GetIsDead(oObject))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, oObject);
                AddHenchman(oPC, oObject);
            }
            AssignCommand(oObject , JumpToLocation(lLoc));
        }
        if(GetObjectType(oObject) == OBJECT_TYPE_ITEM)
            CopyObject(oObject, GetLocation(oDivPool), oDivPool);
        oObject = GetNextObjectInArea(oObject);
    }
}

void MakeSurePCHasMirror()
{
    int nNth = 0;
    object oMirror = GetObjectByTag("q6_mirror", 0);
    // looping, just in case a player brought one in from a previous game or something silly like that
    int bFoundMirrorOnPC = FALSE;
    while(GetIsObjectValid(oMirror))
    {
        if(GetIsPC(GetItemPossessor(oMirror))) bFoundMirrorOnPC = TRUE;
        nNth++;
        oMirror = GetObjectByTag("q6_mirror", nNth);
    }
    if(!bFoundMirrorOnPC)
    {
        CreateItemOnObject("q6_mirror", GetFirstPC());
    }
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
         object oFool = GetObjectByTag("q6_TheFool");
         object oPCWP = GetWaypointByTag("q6b_wp_pc");
         object oQueen = GetObjectByTag("q6_queen2");
         object oPC = GetFirstPC();
         AddJournalQuestEntry("q6_mainquest", 99, GetPCSpeaker());
         while(oPC != OBJECT_INVALID)
         {
            DelayCommand(3.0, FadeToBlack(oPC, FADE_SPEED_FAST));
            DelayCommand(4.5, AssignCommand(oPC, JumpToObject(oPCWP)));
            DelayCommand(6.0, FadeFromBlack(oPC, FADE_SPEED_FAST));
            DelayCommand(6.0, AssignCommand(oQueen, Talk(oPC)));
            oPC = GetNextPC();
         }

        // bug fix: if PC had a full inventory, the mirror would have been dropped
        // in the old area
        DelayCommand(10.0, MakeSurePCHasMirror());

         // remove reaper bindings:
         int i;
         object oAnchor;
         for(i = 1; i <= 5; i++)
         {
            oAnchor = PortalGetAnchor(i, GetFirstPC());
            if(oAnchor != OBJECT_INVALID)
            {
                if(IsInInvalidArea(oAnchor))
                    PortalDeleteAnchor(i, GetFirstPC());
            }

         }

         // remove disease

         ExecuteScript("q6e_cure", GetFirstPC());

         // final XP reward
         Reward_2daXP(GetFirstPC(), 43);

         // jump all henchmen and revive dead ones
         object oArea;
         oArea = GetObjectByTag("q6_NorthernCavern");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6_ShaorisCave");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6_Library");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6e_ShaorisFellTemple");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6f2_ThroneRoom");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6d_wizard_tower1");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6d_wizard_tower2");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6d_wizard_tower3");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
         oArea = GetObjectByTag("q6_Castle");
         JumpObjectsInArea(oArea, GetLocation(oPCWP), oPC);
    }
}
