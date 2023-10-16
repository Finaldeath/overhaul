//::///////////////////////////////////////////////
//:: Barrow Conv Include File
//:: ww1_inc_barrowconv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles the VO timing of the overheard
     conversations at the Barrow Site
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 4, 2004
//:://////////////////////////////////////////////

void PlayBarrowConv(string sConv)
{
    float fDelay = 0.0;
    float fVOLength = 0.0;
    float fSpacer = 0.7;
    string sCurrentLine;
    object oCurrentSpeaker;
    object oVoice;
    object oJager = GetNearestObjectByTag("Jager");
    object oBlauhart = GetNearestObjectByTag("Blauhart");
    object oGreinlager = GetNearestObjectByTag("Greinlager");
    object oArea = GetArea(oJager);

    if (sConv == "ww1_barrowconv_1")
    {
        //Flag the BarrowConv Sound variable so the next conversation won't
        //overlap it
        SetLocalInt(oArea, "bSound", TRUE);

        oCurrentSpeaker = oGreinlager;
        oVoice = GetNearestObjectByTag("ww1_narrator139");
        sCurrentLine = "[Councillor Greinlager]: Blast that elf!";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 1.0;
        fDelay = fDelay + fVOLength + fSpacer;
      //
        oCurrentSpeaker = oBlauhart;
        oVoice = GetNearestObjectByTag("ww1_narrator140");
        sCurrentLine = "[Councillor Blauhart]: Are ye sure the Stone be gone? "+
                       "Mayhaps it fell and skittered into some dark corner we "+
                       "cannot find.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 6.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator141");
        sCurrentLine = "[Jager Steinfaar]: The Cavanaugh Stone be gone, "+
                       "gentlemen, and Brogan's honor with it, stolen by the "+
                       "foreigner.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 5.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oGreinlager;
        oVoice = GetNearestObjectByTag("ww1_narrator142");
        sCurrentLine = "[Councillor Greinlager]: Aye, it be him. He's hidden "+
                       "it somewhere.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 2.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator143");
        sCurrentLine = "[Jager Steinfaar]: Quiet! Keep your voices down lest "+
                       "the whole town learn of what's gone on.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));

        //Remove the BarrowConv Sound variable once the sound is done
        DelayCommand(fDelay+10.0, SetLocalInt(oArea, "bSound", FALSE));
    }
    else if (sConv == "ww1_barrowconv_2")
    {
        //Flag the BarrowConv Sound variable so the next conversation won't
        //overlap it
        SetLocalInt(oArea, "bSound", TRUE);

        oCurrentSpeaker = oBlauhart;
        oVoice = GetNearestObjectByTag("ww1_narrator144");
        sCurrentLine = "[Councillor Blauhart]: At least the elf be captured, "+
                       "even if the Stone still be at large.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 3.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oGreinlager;
        oVoice = GetNearestObjectByTag("ww1_narrator145");
        sCurrentLine = "[Councillor Greinlager]: Ye be sure your mines will "+
                       "hold him, Steinfaar?";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 2.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator146");
        sCurrentLine = "[Jager Steinfaar]: I've followed every one of your "+
                       "foolish safety regulations, Councilman. Ye tell me if "+
                       "me mines will hold him.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 7.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oBlauhart;
        oVoice = GetNearestObjectByTag("ww1_narrator147");
        sCurrentLine = "[Councillor Blauhart]: They be fit to pen in demons, "+
                       "Greinlager. The mines will hold a foolish elf just "+
                       "fine.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 5.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator148");
        sCurrentLine = "[Jager Steinfaar]: Regardless, he be down there now. "+
                       "I've sealed the doors behind him and posted a warning "+
                       "to any of me miners who might have reason to go down.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 8.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oGreinlager;
        oVoice = GetNearestObjectByTag("ww1_narrator149");
        sCurrentLine = "[Councillor Greinlager]: Aye, and now we wait...";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));

        //Remove the BarrowConv Sound variable once the sound is done
        DelayCommand(fDelay+10.0, SetLocalInt(oArea, "bSound", FALSE));
    }
    else if (sConv == "ww1_barrowconv_3")
    {
        //Flag the BarrowConv Sound variable so the next conversation won't
        //overlap it
        SetLocalInt(oArea, "bSound", TRUE);

        oCurrentSpeaker = oGreinlager;
        oVoice = GetNearestObjectByTag("ww1_narrator150");
        sCurrentLine = "[Councillor Greinlager]: Ye think the elf had "+
                       "accomplices for his crime?";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 2.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oBlauhart;
        oVoice = GetNearestObjectByTag("ww1_narrator151");
        sCurrentLine = "[Councillor Blauhart]: He was one soldier in a "+
                       "marching company of maybe fifty. I didn't like the "+
                       "look of them.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 5.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator152");
        sCurrentLine = "[Jager Steinfaar]: They'll be back this way. They went "+
                       "north into the pass and there be nothing else up "+
                       "there except the hag.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 5.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oGreinlager;
        oVoice = GetNearestObjectByTag("ww1_narrator153");
        sCurrentLine = "[Councillor Greinlager]: And when they come back, "+
                       "they'll be none too pleased to find one of their own "+
                       "imprisoned in the village mine.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 5.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator154");
        sCurrentLine = "[Jager Steinfaar]: That's why we have to keep things "+
                       "quiet. There be no evidence the elf be there. If they "+
                       "come back in force, we tell them he went south.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));
      //
        fVOLength = 8.0;
        fDelay = fDelay + fVOLength+ fSpacer;
      //
        oCurrentSpeaker = oJager;
        oVoice = GetNearestObjectByTag("ww1_narrator155");
        sCurrentLine = "[Jager Steinfaar]: If things go wrong... we throw them "+
                       "all into the mine and may the demons have them all.";
        DelayCommand(fDelay, AssignCommand(oCurrentSpeaker, SpeakString(sCurrentLine)));
        DelayCommand(fDelay, SoundObjectPlay(oVoice));
        DelayCommand(fDelay+25.0, SoundObjectStop(oVoice));

        //Remove the BarrowConv Sound variable once the sound is done
        DelayCommand(fDelay+10.0, SetLocalInt(oArea, "bSound", FALSE));
    }
}
