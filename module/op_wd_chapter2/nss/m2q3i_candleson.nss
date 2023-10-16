//::///////////////////////////////////////////////
//:: m2q3I Summoner's Candles (On)
//:: m2q3i_CandlesOn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This ambient script creates an arc of fire
    around the summoning circle.

    Known bug: ambient objects don't have nodes
    yet. Once they do, the visuals will appear.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 25, 2001
//:://////////////////////////////////////////////

void main()
{
    int iNth = 1;
    object oEnter = GetEnteringObject();

    if (GetTag(oEnter) == "M2Q3I_BELIAL")
    {
        //Create a beam of fire between each candelabra and its neighbour
        while (iNth < 7)
        {
            int iOth = iNth+1;
            string sNth = IntToString(iNth);
            string sOth = IntToString(iOth);
            object oSource = GetObjectByTag("m2q3I_Candle_0"+sNth);
            object oTarget = GetObjectByTag("m2q3I_Candle_0"+sOth);
            effect eFlameBeam = EffectBeam(VFX_BEAM_FIRE, oSource, BODY_NODE_CHEST);

            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFlameBeam, oTarget, 99999.9));

            iNth++;
        }

        iNth = 1;

        //Create a beam of fire between each candelabra and its neighbour's neighbour
        while (iNth < 6)
        {
            int iPth = iNth+2;
            string sNth = IntToString(iNth);
            string sPth = IntToString(iPth);
            object oSource = GetObjectByTag("m2q3I_Candle_0"+sNth);
            object oTarget = GetObjectByTag("m2q3I_Candle_0"+sPth);
            effect eFlameBeam = EffectBeam(VFX_BEAM_FIRE, oSource, BODY_NODE_CHEST);

            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFlameBeam, oTarget, 99999.9));

            iNth++;
        }
    }
}
