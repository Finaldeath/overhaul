// This script will spawn one of the three ambush encounters when triggered
// if M1_AmbushPlot has been set to a multiple of 10.  This is set when a
// player delivers a component to Aribeth

void main()
{
    int nPlot = GetLocalInt(GetModule(),"M1_AmbushPlot");

    if(GetIsPC(GetEnteringObject()) && nPlot % 10 == 0 && nPlot != 0)
    {
        string sTemplate;
        string sItem;
        object oSpawnPoint;
        object oThug;
        int nIdx;
        location lLoc;
        switch(nPlot)
        {
            // First ambush: 4 thugs
            case 10:
            {
                sTemplate = "M1_AMBUSHTHUG";
                sItem = "m1q1_letterconsp";
            }
            break;
            // Second Ambush: 6 Assailents
            case 20:             {
                sTemplate = "M1_MYSTASSAIL";
                sItem = "IT_MIDMISC001";
            }
            break;
            //Third Ambush 4 assassins
            case 30:
            {
                sTemplate = "M1_HIREDASSAS";
                sItem = "m1q1_letterspy";
            }
            break;
        }
        for(nIdx = 1; nIdx <= 4; nIdx++)
        {
            lLoc = GetLocation(GetNearestObjectByTag("WP_M1AmbushPlot_" + IntToString(nIdx)));
            oThug = CreateObject(OBJECT_TYPE_CREATURE,sTemplate,lLoc);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),lLoc);
        }
        CreateItemOnObject(sItem,oThug);
        SetLocalInt(GetModule(),"M1_AmbushPlot",nPlot + 1);
    }

}
