#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"

void main()
{
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();//* Use this to create a small amount of treasure on the creature
    object oBolts = CreateItemOnObject("NW_WAMMBO007",OBJECT_SELF,d6());
    ActionEquipItem(oBolts,INVENTORY_SLOT_BOLTS);
}

