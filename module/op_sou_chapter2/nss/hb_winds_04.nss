//::///////////////////////////////////////////////
//:: Name hb_winds_04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Heartbeat of Final Tower.  Start tremors
    when mythalar has been destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 16/03
//:://////////////////////////////////////////////

void main()
{
    //Security fallback to handle rare instances where area-of-effect spells
    //against the mythallar result in Heurodis never losing her invulnerability.
    object oMyth1 = GetObjectByTag("Mythallar_01");
    object oMyth2 = GetObjectByTag("Mythallar_02");
    object oMyth3 = GetObjectByTag("Mythallar_03");
    object oMyth4 = GetObjectByTag("Mythallar_04");
    object oMyth5 = GetObjectByTag("Mythallar_05");
    object oMyth6 = GetObjectByTag("Mythallar_06");
    object oMyth7 = GetObjectByTag("Mythallar_07");
    object oMyth8 = GetObjectByTag("Mythallar_08");
    object oMyth9 = GetObjectByTag("Mythallar_09");
    object oMyth10 = GetObjectByTag("Mythallar_10");
    object oMyth11 = GetObjectByTag("Mythallar_11");
    object oMyth12 = GetObjectByTag("Mythallar_12");
    object oMyth13 = GetObjectByTag("Mythallar_13");
    object oMyth14 = GetObjectByTag("Mythallar_14");
    object oMyth15 = GetObjectByTag("Mythallar_15");
    object oMyth16 = GetObjectByTag("Mythallar_16");
    if (oMyth1 == OBJECT_INVALID &&
        oMyth2 == OBJECT_INVALID &&
        oMyth3 == OBJECT_INVALID &&
        oMyth4 == OBJECT_INVALID &&
        oMyth5 == OBJECT_INVALID &&
        oMyth6 == OBJECT_INVALID &&
        oMyth7 == OBJECT_INVALID &&
        oMyth8 == OBJECT_INVALID &&
        oMyth9 == OBJECT_INVALID &&
        oMyth10 == OBJECT_INVALID &&
        oMyth11 == OBJECT_INVALID &&
        oMyth12 == OBJECT_INVALID &&
        oMyth13 == OBJECT_INVALID &&
        oMyth14 == OBJECT_INVALID &&
        oMyth15 == OBJECT_INVALID &&
        oMyth16 == OBJECT_INVALID)
    {
        object oHeurodis = GetNearestObjectByTag("Heurodis");
        SetPlotFlag(oHeurodis, FALSE);
        SetLocalInt(OBJECT_SELF, "bMythallarDestroyed", TRUE);
    }


    //Handle VFX for city falling after destruction of mythallar
    if (GetLocalInt(OBJECT_SELF, "nTremorsActive") == 1)
    {

        object oCentre = GetWaypointByTag("wp_cut30_shadowdoor_1");
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oCentre);
        if (oPC != OBJECT_INVALID)
        {
            //Random Rubble falling to the sky

            int nRubble = 0;
            string szRubbleTarget;
            float fDelay;
            object oRubble;

            //the two rubble rising effects are 135 and 136
            int nRubVfx;
            effect eRocks = EffectVisualEffect(135);
            effect eRocks2 = EffectVisualEffect(136);

            while (nRubble < 9)
            {
                fDelay = IntToFloat(Random(20) + 1);
                oRubble = GetObjectByTag("obj_winds04_vfx_rubble", nRubble);
                if (GetLocalInt(oRubble, "nActivated") != 1)
                {
                    SetLocalInt(oRubble, "nActivated", 1);
                    if (nRubble%2 == 0)
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eRocks, oRubble));
                    else
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eRocks2, oRubble));
                    DelayCommand(25.0, SetLocalInt(oRubble, "nActivated", 0));
                }
                nRubble++;
                oRubble = GetObjectByTag("obj_winds04_vfx_rubble", nRubble);
            }

            //ScreenShake
            if (GetLocalInt(OBJECT_SELF, "X1_nFinalScreenShake") != 1)
            {
                SetLocalInt(OBJECT_SELF, "X1_nFinalScreenShake", 1);
                object oShakePC = GetFirstPC();
                effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
                effect eBump = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
                effect eShakeBump = EffectLinkEffects(eShake, eBump);
                fDelay = IntToFloat(Random(12));
                while (oShakePC != OBJECT_INVALID)
                {

                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShakeBump, oPC));

                    oShakePC = GetNextPC();
                }
                DelayCommand(12.0, SetLocalInt(OBJECT_SELF, "X1_nFinalScreenShake", 0));
            }
            //Smoke Effects
            int nSmokeCount = 0;
            int nDelay;
            effect eSmoke1 = EffectVisualEffect(134);
            //effect eSmoke2 = EffectVisualEffect(VFX_IMP_DEATH_L);
            object oSmoke = GetObjectByTag("wp_winds04_smoke", nSmokeCount);
            while (nSmokeCount < 26)
            {
                nDelay = Random(6);
                DelayCommand(IntToFloat(nDelay), ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSmoke1, GetLocation(oSmoke)));
                //DelayCommand(IntToFloat(nDelay), ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSmoke2, GetLocation(oSmoke)));

                nSmokeCount++ ;
                oSmoke = GetObjectByTag("wp_winds04_smoke", nSmokeCount);
            }
            /*
            //Swirling Purple Smoke effects
            int nStunCount = 0;
            effect eStun1 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
            effect eStun2 = EffectVisualEffect(VFX_IMP_DEATH_L);
            object oStun = GetObjectByTag("wp_winds04_pwstun", nStunCount);
            while (nStunCount < 10)
            {
                nDelay = Random(6);
                DelayCommand(IntToFloat(nDelay), ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eStun1, GetLocation(oStun)));
                DelayCommand(IntToFloat(nDelay), ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eStun2, GetLocation(oSmoke)));

                nStunCount++ ;
                oStun = GetObjectByTag("wp_winds04_pwstun", nStunCount);
            }
            */
            //Activate permanent vapour trails
            int nVapourCount = 0;
            effect eVapour = EffectVisualEffect(133);

            object oVapour1 = GetObjectByTag("wp_winds04_vapourtrail1", nVapourCount);
            object oVapour2 = GetObjectByTag("wp_winds04_vapourtrail2", nVapourCount);
            object oVapour3 = GetObjectByTag("wp_winds04_vapourtrail3", nVapourCount);
            object oVapour4 = GetObjectByTag("wp_winds04_vapourtrail4", nVapourCount);
            object oVapour5 = GetObjectByTag("wp_winds04_vapourtrail5", nVapourCount);
            object oVapour6 = GetObjectByTag("wp_winds04_vapourtrail6", nVapourCount);
            object oVapour7 = GetObjectByTag("wp_winds04_vapourtrail7", nVapourCount);
            object oVapour8 = GetObjectByTag("wp_winds04_vapourtrail8", nVapourCount);
            /*object oVapour9 = GetObjectByTag("wp_winds04_vapourtrail9", nVapourCount);
            object oVapour10 = GetObjectByTag("wp_winds04_vapourtrail0", nVapourCount);
            object oVapour11 = GetObjectByTag("wp_winds04_vapourtrail11", nVapourCount);
            object oVapour12 = GetObjectByTag("wp_winds04_vapourtrail12", nVapourCount);
            object oVapour13 = GetObjectByTag("wp_winds04_vapourtrail13", nVapourCount);
            object oVapour14 = GetObjectByTag("wp_winds04_vapourtrail14", nVapourCount);
            object oVapour15 = GetObjectByTag("wp_winds04_vapourtrail15", nVapourCount);
            object oVapour16 = GetObjectByTag("wp_winds04_vapourtrail16", nVapourCount);
            */

            vector vVapour1 = GetPosition(oVapour1);
            vector vEffect1 = Vector(vVapour1.x, vVapour1.y, vVapour1.z - 1.5);
            location lEffect1 = Location(OBJECT_SELF, vEffect1,90.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1);
            //DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
           //DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));
            //DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1));

            vector vVapour2 = GetPosition(oVapour2);
            vector vEffect2 = Vector(vVapour2.x, vVapour2.y, vVapour2.z - 1.5);
            location lEffect2 = Location(OBJECT_SELF, vEffect2,45.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2);
            /*DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect2));
*/
            vector vVapour3 = GetPosition(oVapour3);
            vector vEffect3 = Vector(vVapour3.x, vVapour3.y, vVapour3.z - 1.5);
            location lEffect3 = Location(OBJECT_SELF, vEffect3, 90.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3);
            /*DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect3));
*/
            vector vVapour4 = GetPosition(oVapour4);
            vector vEffect4 = Vector(vVapour4.x, vVapour4.y, vVapour4.z - 1.5);
            location lEffect4 = Location(OBJECT_SELF, vEffect4, 45.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4);
            /*DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect4));
*/


            vector vVapour5 = GetPosition(oVapour5);
            vector vEffect5 = Vector(vVapour5.x, vVapour5.y, vVapour5.z - 1.5);
            location lEffect5 = Location(OBJECT_SELF, vEffect5, 90.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5);
            /*DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect5));
*/
            vector vVapour6 = GetPosition(oVapour6);
            vector vEffect6 = Vector(vVapour6.x, vVapour6.y, vVapour6.z - 1.5);
            location lEffect6 = Location(OBJECT_SELF, vEffect6,  90.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6);
            /*DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect6));
*/
            vector vVapour7 = GetPosition(oVapour7);
            vector vEffect7 = Vector(vVapour7.x, vVapour7.y, vVapour7.z - 1.5);
            location lEffect7 = Location(OBJECT_SELF, vEffect7, 90.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7);
           /* DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect7));
*/

            vector vVapour8 = GetPosition(oVapour8);
            vector vEffect8 = Vector(vVapour8.x, vVapour8.y, vVapour8.z - 1.5);
            location lEffect8 = Location(OBJECT_SELF, vEffect5, 450.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8);
           /*DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect8));
*/
            /*
            vector vVapour9 = GetPosition(oVapour9);
            vector vEffect9 = Vector(vVapour9.x, vVapour9.y, vVapour9.z - 1.5);
            location lEffect9 = Location(OBJECT_SELF, vEffect9, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect9));


            vector vVapour10 = GetPosition(oVapour10);
            vector vEffect10 = Vector(vVapour10.x, vVapour10.y, vVapour10.z - 1.5);
            location lEffect10 = Location(OBJECT_SELF, vEffect10, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect10));


            vector vVapour11 = GetPosition(oVapour11);
            vector vEffect11 = Vector(vVapour11.x, vVapour11.y, vVapour11.z - 1.5);
            location lEffect11 = Location(OBJECT_SELF, vEffect11, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect11));

            vector vVapour12 = GetPosition(oVapour12);
            vector vEffect12 = Vector(vVapour12.x, vVapour12.y, vVapour12.z - 1.5);
            location lEffect12 = Location(OBJECT_SELF, vEffect12, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect12));


            vector vVapour13 = GetPosition(oVapour5);
            vector vEffect13 = Vector(vVapour13.x, vVapour13.y, vVapour13.z - 1.5);
            location lEffect13 = Location(OBJECT_SELF, vEffect13, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect13));


            vector vVapour14 = GetPosition(oVapour14);
            vector vEffect14 = Vector(vVapour14.x, vVapour14.y, vVapour14.z - 1.5);
            location lEffect14 = Location(OBJECT_SELF, vEffect14, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect14));


            vector vVapour15 = GetPosition(oVapour15);
            vector vEffect15 = Vector(vVapour15.x, vVapour15.y, vVapour15.z - 1.5);
            location lEffect15 = Location(OBJECT_SELF, vEffect15, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect15));


            vector vVapour16 = GetPosition(oVapour16);
            vector vEffect16 = Vector(vVapour16.x, vVapour16.y, vVapour16.z - 1.5);
            location lEffect16 = Location(OBJECT_SELF, vEffect16, 0.0);
            //location lEffect1 = GetLocation(oVapour);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect1);
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVapour, lEffect16));
            */
            object oHeurodis = GetObjectByTag("obj_winds04_leaf");
            if (GetLocalInt(OBJECT_SELF, "nLeafsDone") != 1)
            {

                SetLocalInt(OBJECT_SELF, "nLeafsDone", 1);
                effect eLeafEffect = EffectVisualEffect(132);
                object oLeafObject = GetObjectByTag("obj_winds04_leaf");
                location lLeafEffect = GetLocation(oLeafObject);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLeafEffect, oHeurodis, 1000.0);
                //DelayCommand(16.0, SetLocalInt(OBJECT_SELF, "nLeafsDone", 0));

            }
        }
    }

}
