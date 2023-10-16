//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        int nCasting = GetLocalInt(OBJECT_SELF, "Q2B_CASTING");
        effect eVis;
        if(nCasting)
        {
            object oWP = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
            if(!GetCommandable())
                SetCommandable(TRUE);
            int nRand = Random(6) + 1;
            switch(nRand)
            {
                case 1:
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    ActionPlayAnimation(ANIMATION_FIREFORGET_READ);
                    break;
                case 2:
                    ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 3.0);
                    ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED);
                    break;
                case 3:
                    ActionCastSpellAtLocation(SPELL_FLESH_TO_STONE, GetLocation(oWP), METAMAGIC_ANY, TRUE);
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                case 4:
                    ActionCastSpellAtLocation(SPELL_GREATER_DISPELLING, GetLocation(oWP), METAMAGIC_ANY, TRUE);
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                case 5:
                    ActionCastFakeSpellAtLocation(SPELL_SUNBURST, GetLocation(oWP));
                    eVis = EffectVisualEffect(VFX_FNF_SUNBEAM);
                    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP)));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                case 6:
                    ActionCastSpellAtLocation(SPELL_WORD_OF_FAITH, GetLocation(oWP), METAMAGIC_ANY, TRUE);
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                default:
                    break;
            }
        }
    }
    return;
    //SPELL_PLANAR_BINDING
    //
    //
}
