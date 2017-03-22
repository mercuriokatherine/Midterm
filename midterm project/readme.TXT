OSHA Workplace Safety
README
Updated March 2006

The OSHA Workplace Safety database consists of all federal inspections at companies in the U.S. and its territorie between 1972 and 2005. OSHA provided the data to NICAR in March 2006.

The data ranges from January 1972 into February 2006. It includes a great deal of detail of each inspection during that time, including violations, accidents and penalities. For more detail or to verify facts, you can obtain copies of the actual reports.

TABLES

We provide these data tables with information about OSHA inspections:
	
	Osha.dbf - main table with company name, address, date of inspection, etc. 
	
	Viol.dbf - violations from each inspection

	Accid.dbf - details about accident victims

	Hazsub.dbf - hazardous substances involved

	Debt.dbf - status of debt

	History.dbf - outlines a history of any changes in penalty

	Admpay.dbf - a record of collecting administrative fees or penalties

	Prog.dbf - special programs the inspection might be involved in

	Relact.dbf - whether the inspection is related to another inspection or other action

	Optinfo.dbf - optional information
	



The tables can be joined using the ACTIVITYNO field. You may notice that some numbers in the ACTIVITYNO field appear more than once. This number is supposed to be a unique identifier per OSHA inspection. According to Bruce Beveridge, OSHA stores each inspection as one single record in their database. When they create files for public use, they are forced to split large records into several records. The problem occurs when an inspection has more violations than one record can contain. In this case, they will begin a new record with the same unique identifying number. All of the inspection information will be the same, what you will notice is different is the violation information included. 


Here are the tables and more information on what they contain:

*Accidents (ACCID.DBF): Names of those injured, identifies the task that was being performed when the accident occurred, indicates whether a hazardous substance contributed to the accident, lists which body parts were injured, and indicates the degree of  the injury -- for example, whether it was fatal.

*Hazardous Substances (HAZSUB.DBF): Describes accidents that involve hazardous substances but that do not involve people.

*OSHA (OSHA.DBF): Gives company sites, previous violations,  the number of workers employed at the site in the previous 12 months and other OSHA activity at the sites, such as inspections or complaints.

*Violations (VIOL.DBF): Details penalties, types of violations -- willful, repeat, serious, etc. -- and the number of employees exposed to the danger.

*Special Programs (PROG.DBF): A description of any special programs -- local or national -- related to the specific inspection. Also included is documentation to explain further.

*Related Activity (RELACT.DBF) - If the inspection is related to another inspection, then the ACTIVITYNO of that inspection is listed. Other types of actions that might be related include Accidents, Complaints or Referrals.

*Optional Information (OPTINFO.DBF) - Indicates additional information recorded for the inspection.

*Debt (DEBT.DBF) - Information about a debt, including interest, fees and the outcome of the debt.

*Event History (HISTORY.DBF) - The history of penalties or failure to abate, including the amount and reason the amount was changed

*Administrative or Pay (ADMPAY.DBF) - A record of payment of administrative fees, penalties or failure-to-abate charges.

LAYOUTS, LOOKUPS AND CODES

The text files (Accid.txt, Hazsub.txt, Osha.txt, Viol.txt, Prog.txt, Relact.txt, Optinfo.txt, Debt.txt, History.txt, Admpay.txt) are the layouts for the 10 tables. These files also contain codes for each table. Over the years, we've discovered a few missing definitions for codes; we suspect most of those are internal typos at OSHA offices.

The remaining files (in the lookups folder) contain additional coding information for all of the tables. These files were current for OSHA as of April 2005, but some haven't changed since at least 1995. Use the text files in the folder LAYOUTS to find which file goes with which table: 

	ACC.DBF -- Accident Victim Attribute Code Values     
	FDA.DBF -- Federal Agency Code Values
	HZS.DBF -- Hazardous Substance Code Values
	OCC.DBF -- Occupational Code Values
	RID.DBF -- OSHA Office (Report ID or RID) Codes
	SCC.DBF -- State-City, State-County Code Values
	SIC.DBF -- Standard Industrial Classification Codes
	NAICS.DBF -- North American Industry Classification System Codes
	NEPTABLE.DBF -- Codes and descriptions for national special programs
	LEPTABLE.DBF -- Codes and descriptions for local special programs
	OPTINFO.DOC -- Codes and descriptons for optional information
	STD.DBF -- OSHA Federal Part-Section Standards Codes 
		  	   



2) Examine penalty fields carefully. There are several different fields, each with a different meaning -- 

In the OSHA table:
	PENREMIT -- This is the sum of penalties the company has paid on all violations up to the time NICAR received the data. (Note: this amount may be lower than the amount in PENNCURRENT because it reflects only the amount OSHA has received, not the amount the agency expects to receive.)
	FTAREMIT -- this is the final amount in failure to abate penalties paid by the company. 
	TOTPENLTY -- This is the total current amount in penalties issued. (this amount may have been result of negotiations between company and OSHA.)
	TOTALFTA -- This is the total current amount in failure to abate penalties issued. (this amount could also have been negotiated)	

In the VIOLS table:
	PENINITIAL -- This is the initial amount of penalties issued after the violation is assessed, but before appeals and reductions.
	PENCURRENT -- This represents the total amount OSHA has collected or expects to collect. This does not mean that OSHA will actually collect this money. (Sometimes payment is not complete due bankruptcy or other reasons.) This amount can be different from the one originally assessed, (found in the PENINITIAL field), because it reflects any changes made to the total due to negotiations, reductions, etc.
	FTAPEN -- Amount of failure to abate penalties issued for that violation.

In the HISTORY table:
	FTAPEN -- FTA penalty at the time current event/activity applied to record
	HISTPEN -- Penalty at the time current activity/event applied to record
	
In the ADMPAY table:
	PENAMT -- Amount of payment received for assessed penalties		
	FTAAMT -- Amount of payment received for failure-to-abate charge




