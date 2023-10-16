//::///////////////////////////////////////////////
//:: Name crypt3_dth_skull
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   50% chance each time its disturbed of destroying
   itself and creating undead..
   Possible Undead to create:
    nw_spectre
    nw_wraith
    nw_skelwarr01
    nw_shfiend
    nw_zombwarr01
    nw_vampire001

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 2/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoneOnce") != 1)
    {


            SetLocalInt(OBJECT_SELF, "nDoneOnce", 1);
            location lTarget = GetLocation(OBJECT_SELF);
            string szUndead;
            switch (Random(6) + 1)
            {
                case 1: szUndead = "nw_spectre";
                        break;
                case 2: szUndead = "nw_wraith";
                        break;
                case 3: szUndead = "nw_skelwarr01";
                        break;
                case 4: szUndead = "nw_shfiend";
                        break;
                case 5: szUndead = "nw_zombwarr01";
                        break;
                case 6: szUndead = "nw_vampire001";
                        break;
            }

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lTarget);
            //DestroyObject(OBJECT_SELF, 0.5);
            CreateObject(OBJECT_TYPE_CREATURE, szUndead, lTarget);



    }
}
