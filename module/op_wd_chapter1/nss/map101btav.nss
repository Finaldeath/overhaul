void main()
{
object oEntered = GetEnteringObject();

if(GetTag(oEntered) ==  "Bloodsailor101a")
    {
        ActionWait(2.0);
        AssignCommand(GetObjectByTag("Bloodsailor101a"),SpeakString("Hi."));
        SetLocalInt(oEntered,"BloodMovedToVasco",1);
        AssignCommand(GetObjectByTag("Bloodsailor101a"),ActionWait(5.0));
        SignalEvent(GetObjectByTag("Bloodsailor101a"),EventUserDefined(1));
//*        SignalEvent(GetObjectByTag("Bloodsailor101a"),EventUserDefined(2));
    }
}
