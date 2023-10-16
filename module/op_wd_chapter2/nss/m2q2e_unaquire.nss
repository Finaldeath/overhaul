// * Place seeds near soil will sprout a tree
#include "nw_i0_plot"


void main()
{
    location lItemDropped = GetLocation(GetModuleItemLostBy());
    object oSoil = OBJECT_INVALID;
//    int nFound = 0;
    int nSpawnSkel = FALSE;
    // * this is the nearest torch
    int i = 0;
    for (i = 1; i <= 5; i++)
    {
        object oPos = OBJECT_INVALID;
        switch (i)
        {
            case 1:
                oPos = GetObjectByTag("WP_M2Q2SOIL_01");
                nSpawnSkel = TRUE;
            break;
            case 2:
                oPos = GetObjectByTag("WP_M2Q2SOIL_02");
                nSpawnSkel = TRUE;
            break;
            case 3:
                oPos = GetObjectByTag("WP_M2Q2SOIL_03");
                nSpawnSkel = TRUE;
            break;
            case 4:
                oPos = GetObjectByTag("WP_M2Q2SOIL_04");
                nSpawnSkel = TRUE;
            break;
            case 5:
                oPos = GetObjectByTag("WP_M2Q3SOIL_05");
                nSpawnSkel = FALSE;
            break;
        }
          // * GEMS CANNOT BE REMOVED!!!!!!!!!!!!!!!!!!!!!!!!!!!
        oSoil = GetNearestObjectByTag("M2Q2ITDRUIDSEEDS", oPos);
        if (GetIsObjectValid(oSoil) == TRUE && GetDistanceBetweenLocations(GetLocation(oPos), GetLocation(oSoil)) < 2.5)
        {
            //* Plant Tree, Destroy Seed
            if (GetTag(GetModuleItemLost()) == "M2Q2ITDRUIDSEEDS")
            {
                effect eAOE = EffectAreaOfEffect(AOE_PER_ENTANGLE);
                ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lItemDropped, RoundsToSeconds(1));
                DestroyObject(GetModuleItemLost());
                if (nSpawnSkel)
                {
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2CSKELCAP",GetLocation(GetWaypointByTag("WP_M2Q2SkelCaptainSpawn")));
                }
                CreateObject(OBJECT_TYPE_PLACEABLE, "M2Q2PLDRUIDTREE", lItemDropped);
            }
        }
    }
//    AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),SpeakString(IntToString(nFound)));

}
