void KillAndLeaveBody(object oMark, string sTemplate);
void ActivateEncounters(string sTag);
void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 200:
        {
            DestroyObject(GetObjectByTag("M0Q0_SKELETON"));
            DestroyObject(GetObjectByTag("M1Q0BDummy"));
            DestroyObject(GetObjectByTag("M1Q0BDummy01"));
            DestroyObject(GetObjectByTag("M1Q0BDummy01",1));
            DestroyObject(GetObjectByTag("M1Q0BSpellTarget"));
            DestroyObject(GetObjectByTag("M1Q0BStealTarget"));
            DestroyObject(GetObjectByTag("M1Q0BStealTarget",1));
            DestroyObject(GetObjectByTag("M1Q0BTarget"));
            DestroyObject(GetObjectByTag("M1Q0APavel"));

            KillAndLeaveBody(GetObjectByTag("M0Q0_KETTA"),"m1q0kettabody");
            KillAndLeaveBody(GetObjectByTag("M1Q0BElynwyd"),"m1q0elwyndbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0BDendy"),"m1q0dendybody");
            KillAndLeaveBody(GetObjectByTag("M1Q0BHewwet"),"m1q0hewwetbody");
            KillAndLeaveBody(GetObjectByTag("M0Q0_HERBAN"),"m1q0herbanbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0BJaroo"),"m1q0jaroobody");
            KillAndLeaveBody(GetObjectByTag("M0Q0_BERNA"),"m1q0bernabody");
            KillAndLeaveBody(GetObjectByTag("M0Q0_OLGERD"),"m1q0olgredbody");
            KillAndLeaveBody(GetObjectByTag("M0q01a05Ferd"),"m1q0ferdinanbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0ABim"),"m1q0bimbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Gilbert"),"m1q0gilbertbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Shade"),"m1q0shadebody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Zedir"),"m1q0zedirbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Chandra"),"m1q0chandrabody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Tabitha"),"m1q0tabithabody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Bruno"),"m1q0brunobody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Ansel"),"m1q0anselbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Erdan"),"m1q0erdanbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Injured"),"m1q0injuredbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Silk"),"m1q0silkbody");
            KillAndLeaveBody(GetObjectByTag("M1Q0Guard"),"m1q0guardbody");

            CreateObject(OBJECT_TYPE_CREATURE,
                         "M0Q0_SUMMON_MAGE",
                         GetLocation(GetObjectByTag("WP_M1Q0BMage")));
            ActivateEncounters("ENC_M1Q0D17Goblin");

// switches to dungeon music.
            MusicBackgroundChangeDay(OBJECT_SELF,7);
            MusicBackgroundChangeNight(OBJECT_SELF,7);
// switches to muffled combat ambient bed track
            //AmbientSoundStop(OBJECT_SELF);
            //AmbientSoundStop(GetObjectByTag("M0Q1A"));
// removes the shouting sound objects
            SoundObjectStop(GetObjectByTag("SND_M1Q2SoldierCalls"));
            SoundObjectStop(GetObjectByTag("SND_M1Q2OfficerCalls"));
            SoundObjectPlay(GetObjectByTag("M1Q0ASound1"));
            SoundObjectPlay(GetObjectByTag("M1Q0ASound2"));
            SoundObjectPlay(GetObjectByTag("M1Q0BSound1"));
            SoundObjectPlay(GetObjectByTag("M1Q0BSound2"));
        }
        break;
    }
}

void KillAndLeaveBody(object oMark,string sTemplate)
{
    object oReplacement;
    location lLoc = GetLocation(oMark);
    if(GetIsObjectValid(oMark))
    {
        object oReplacement;
        DestroyObject(oMark);
        oReplacement = CreateObject(OBJECT_TYPE_CREATURE,sTemplate,lLoc);
        //SetPlotFlag(oReplacement,FALSE);
       //AssignCommand(oReplacement,SetIsDestroyable(FALSE,FALSE));
        //AssignCommand(OBJECT_SELF,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),oMark));
        //PrintString("Target - " + GetName(oMark));
    }
}

void ActivateEncounters(string sTag)
{
    int nNth;
    object oEncounter = GetObjectByTag(sTag,nNth);
    while(GetIsObjectValid(oEncounter))
    {
        SetEncounterActive(TRUE,oEncounter);
        nNth++;
        oEncounter = GetObjectByTag(sTag,nNth);
    }
}
