void main()
{
    switch (GetUserDefinedEventNumber())
    {
        case 100:
        {
            object oGraduate;
            location lLoc;
            int nIdx;
            for (nIdx = 1; nIdx <= 4; nIdx++)
            {
                lLoc = GetLocation(GetObjectByTag("WP_M1Q0CAmbush_0" + IntToString(nIdx)));
                CreateObject(OBJECT_TYPE_CREATURE,"M0Q0_EVILMAGE_02",lLoc);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                                      EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),
                                      lLoc);
            }
            nIdx = 0;
            oGraduate = GetObjectByTag("M1Q0C_Graduate",nIdx);
            while (GetIsObjectValid(oGraduate))
            {
                SetPlotFlag(oGraduate,FALSE);
                nIdx++;
                oGraduate = GetObjectByTag("M1Q0C_Graduate",nIdx);
            }
            AmbientSoundChangeDay(OBJECT_SELF,26);
            AmbientSoundChangeNight(OBJECT_SELF,26);
            MusicBackgroundStop(OBJECT_SELF);
        }
        break;
    }
}
