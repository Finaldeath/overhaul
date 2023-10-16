//::///////////////////////////////////////////////
//:: Name q2c2_use_pool
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
       If all 4 of the coloured chains have been
       attached to the appropriate pedastals, then
       using this pool will start the 'Simon' puzzle.
       Otherwise, the PC should get a generic message
       saying that not all the chains are in place.
       The Simon Puzzle will consist of a series of
       colours appearing above the well.  The PC must
       then correctly click the coloured chains in the
       same order.  Succeeding will open the door to
       q2c3.  Failure should result in some kind of
       punishment to the PC before he can try again.
       Maybe chain lighting from the pillars will hit
       nearby PCs
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 6
//:://////////////////////////////////////////////
//Update Nov 5/03 - Only randomize the pools colours once
void GenerateColour(int nCount);

void main()
{
    //if its not equal to 4 then not all the chains have been pulled so
    //give the generic conversation
    if (GetLocalInt(GetModule(), "nQ2C2ChainCount") != 4)
    {
        SpeakOneLinerConversation();
    }
    //else all 4 chains are in place so begin the 'Simon' puzzle
    else
    {

        //Start the colour patterns appearing - if we are not between rounds (nWait !=1)
        if (GetLocalInt(GetModule(),"nQ2C2Wait") != 1  && GetLocalInt(GetModule(),"nQ2C2Finished") != 1)
        {

            FloatingTextStrRefOnCreature(84131 , GetLastUsedBy());

            //We need to generate six random colours appearing one after the other above the Pool of Colours
            //Store which colours were generated as module variables - then wait for the PC to try and repeat the pattern
            //if successfully done, the door to q2c3 will open - otherwise - a lightning trap will be set.

            //Get the number of colours that need to be generated.
            int nColours = 6;


            int nCount;
            float fDelay = 1.5f;
            string szColour;
            //Generate as many colours as is needed.
            for (nCount = 0; nCount < nColours; nCount++)
            {

               DelayCommand(fDelay,GenerateColour(nCount));

               fDelay = fDelay + 3.0f;


            }
            DelayCommand(fDelay, SetLocalInt(GetModule(),"nQ2C2Wait",1));
            SetLocalInt(GetModule(),"nQ2C2Selection",0);
       }
       else
       {
        //Can't activate the pool again till the round is done.
            if (GetLocalInt(GetModule(),"nQ2C2Wait") == 1)

                FloatingTextStrRefOnCreature(3840, GetLastUsedBy());


            if (GetLocalInt(GetModule(),"nQ2C2Finished") == 1)

                FloatingTextStrRefOnCreature(3839, GetLastUsedBy());

        }


    }
}

//random colour generator
//Generate the colours
//possibilities are sol purple,white,green,orange,blue,cyan,red,yellow
//Store the chosen colour in a module variable 'Colour0-7'
void GenerateColour(int nCount)
{
    string szColour = GetLocalString(GetModule(),"szQ2C2Colour" + IntToString(nCount));
    //if its never been created before - use the random colour - if not - use the stored colour
    if (szColour == "")
    {
        switch (Random(4))
        {
            case 0: szColour = "solpurple";
                    break;

            case 1: szColour = "solgreen";
                    break;

            case 2: szColour = "solred";
                    break;

            case 3: szColour = "solyellow";
                    break;

        }
        SetLocalString(GetModule(),"szQ2C2Colour" + IntToString(nCount),szColour);
    }

    //Create the Shaft of Light, then destroy it after 2 seconds.
    CreateObject(OBJECT_TYPE_PLACEABLE,szColour,GetLocation(GetObjectByTag("q2c2_generate")));

    DestroyObject(GetObjectByTag(szColour),1.5f);
}

