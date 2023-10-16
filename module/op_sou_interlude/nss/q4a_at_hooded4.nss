/*Heurodis walks to the PC
display feedback of taking the mythallar
then have her walk a short distance away and use
magical effect to teleport
focus in on the PC
cut to the next chapter*/


void main()
{
     SetLocalInt(OBJECT_SELF, "DIALOG_STATUS", 3);
     SignalEvent(OBJECT_SELF, EventUserDefined(102));
}
