// * this script fires for the guards in the prison district bk
#include "NW_I0_Generic"
void main()
{
    switch (GetUserDefinedEventNumber())
    {
        case 1003:
        {
            int nCount = GetLocalInt(OBJECT_SELF,"NW_L_Count");
            if(nCount == 0)
            {
                SpeakOneLinerConversation();
            }
            nCount++;
            if(nCount >= 4)
            {
                nCount = 0;
            }
            SetLocalInt(OBJECT_SELF,"NW_L_Count",nCount);
        }
        break;
        case 1005:
        {
            object oDevourer = GetObjectByTag("M1Q2_DEVOUR");
            if( (GetLastAttacker() == oDevourer) && !GetLocalInt(OBJECT_SELF, "NW_L_Leaving"))
            {
                SetLocalInt(OBJECT_SELF,"M1Q02BloodSailorTransformed",1);
                effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
                ClearAllActions();
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,OBJECT_SELF);
                ChangeFaction(OBJECT_SELF,oDevourer);
                //SpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
                DestroyObject(oDevourer);
                DetermineCombatRound();
            }
        }
        break;
        case 1007:
        //* Blood Sailor into Intellect Devourer, jumps into next Blood Sailor
        {
            if(GetLocalInt(OBJECT_SELF,"M1Q02BloodSailorTransformed") == 1)
            {
                ClearAllActions();
                location lSpawn = GetLocation(OBJECT_SELF);
                CreateObject(OBJECT_TYPE_CREATURE,"M1Q2_DEVOUR",lSpawn);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(TRUE),OBJECT_SELF);
            }
        }
        break;
    }
}
