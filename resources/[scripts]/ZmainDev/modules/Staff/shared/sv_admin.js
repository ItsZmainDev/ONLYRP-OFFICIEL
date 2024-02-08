// const Discord = require("discord.js")
// const { Client, GatewayIntentBits, Collection, MessageAttachment } = require("discord.js");
// const client = new Client({
//     partials: ['MESSAGE', 'REACTION', 'CHANNEL'],
//     intents: [
//         GatewayIntentBits.Guilds,
//         GatewayIntentBits.GuildMessages,
//         GatewayIntentBits.MessageContent,
//         GatewayIntentBits.GuildMembers,
//     ],
// });
// const { EmbedBuilder } = require('discord.js');
// const config = {
//     token: "MTA4NTMwOTQ4OTc2NDM4MDc1Mw.GvRFxK.qVgiEBZ6lTIyK80ZxOgybxPSkWVm3NNssTBQ84",
//     prefix: "*"
// }
// const prefix = (config.prefix)

// const axios = require('axios')

// async function ok() {
//     const serverIP = '193.38.250.32'; // Mettez l'adresse IP de votre serveur CFX.re
//     const serverPort = '30120'; // Mettez le port de votre serveur CFX.re
//     const response = await axios.get('https://status.cfx.re/api/v2/status.json');
//     oo = '🔴 Hors ligne'
//     if (response.statusText === "OK") {
//         oo = '🟢 En ligne'
//     }

//     // const server = new FiveM('193.38.250.32:30121')

//     const net = require('net');


//     const apiUrl = `http://${serverIP}:${serverPort}/players.json`;

//     const now = new Date();
//     const hours = now.getHours();
//     const minutes = now.getMinutes();


// function getPlayerCount() {
// try {
//     axios.get(apiUrl)
//       .then(response => {
//         const playerCount = response.data.length;
//         function checkServerStatus() {
//             const c = new net.Socket();
          
//             const timeout = setTimeout(() => {
//                 console.log('HORS LIGNE')
//                 online = '🔴 Hors ligne'

//                 const embed = new EmbedBuilder()
//                 .setTitle('OnlyRP - Statut serveur')
//                 .setColor('Purple')
//                 .addFields(
//                     {
//                         "name": "> Connexion via F8",
//                         "value": "```\nconnect fivem.onlyrp.fr:30120\n```",
//                         "inline": false
//                     },
//                     {
//                         "name": "> OnlyRP",
//                         "value": `\`\`\`\n${online}\n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Joueurs",
//                         "value": `\`\`\`\n${playerCount} joueurs\n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> API CFX",
//                         "value": `\`\`\`\n${oo} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Bot OnlyRP",
//                         "value": `\`\`\`\n${online} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> FiveM",
//                         "value": `\`\`\`\n${oo} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Uptime",
//                         "value": `\`\`\`\n${"Indéfini"} \n\`\`\``,
//                         "inline": true
//                     },
//                 )
//                 .setFooter({ text: 'oBot 1.0.0 update toutes les 5 secondes • Today at ' + hours + ':' + minutes, iconURL: 'https://cdn.discordapp.com/attachments/1085637890228371596/1137853910753759302/ONLY_RP.png' });
        
//                 client.channels.cache.get('1092151812783612066').messages.fetch("1137832430108147842").then(msg => {
//                     msg.edit({embeds: [embed]});
//                 });
//               c.destroy();
//             }, 5000);
          
//             c.connect(serverPort, serverIP, () => {
//               clearTimeout(timeout);

//                 online = '🟢 En ligne'

//                 const embed = new EmbedBuilder()
//                 .setTitle('OnlyRP - Statut serveur')
//                 .setColor('Purple')
//                 .addFields(
//                     {
//                         "name": "> Connexion via F8",
//                         "value": "```\nconnect fivem.onlyrp.fr:30120\n```",
//                         "inline": false
//                     },
//                     {
//                         "name": "> OnlyRP",
//                         "value": `\`\`\`\n${online}\n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Joueurs",
//                         "value": `\`\`\`\n${playerCount} joueurs\n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> API CFX",
//                         "value": `\`\`\`\n${oo} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Bot OnlyRP",
//                         "value": `\`\`\`\n${online} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> FiveM",
//                         "value": `\`\`\`\n${oo} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Uptime",
//                         "value": `\`\`\`\n${"Indéfini"} \n\`\`\``,
//                         "inline": true
//                     },
//                 )
//                 .setFooter({ text: 'oBot 1.0.0 update toutes les 5 secondes • Today at ' + hours + ':' + minutes, iconURL: 'https://cdn.discordapp.com/attachments/1085637890228371596/1137853910753759302/ONLY_RP.png' });
        
//                 client.channels.cache.get('1092151812783612066').messages.fetch("1137832430108147842").then(msg => {
//                     msg.edit({embeds: [embed]});
//                 });
//               c.end();
//             });
          
//             client.on('error', (error) => {
//               clearTimeout(timeout);
//               online = '🔴 Hors ligne'

//               const embed = new EmbedBuilder()
//               .setTitle('OnlyRP - Statut serveur')
//               .setColor('Purple')
//               .addFields(
//                     {
//                         "name": "> Connexion via F8",
//                         "value": "```\nconnect fivem.onlyrp.fr:30120\n```",
//                         "inline": false
//                     },
//                     {
//                         "name": "> OnlyRP",
//                         "value": `\`\`\`\n${online}\n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Joueurs",
//                         "value": `\`\`\`\n${playerCount} joueurs\n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> API CFX",
//                         "value": `\`\`\`\n${oo} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Bot OnlyRP",
//                         "value": `\`\`\`\n${online} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> FiveM",
//                         "value": `\`\`\`\n${oo} \n\`\`\``,
//                         "inline": true
//                     },
//                     {
//                         "name": "> Uptime",
//                         "value": `\`\`\`\n${"Indéfini"} \n\`\`\``,
//                         "inline": true
//                     },
//               )
//               .setFooter({ text: 'oBot 1.0.0 update toutes les 5 secondes • Today at ' + hours + ':' + minutes, iconURL: 'https://cdn.discordapp.com/attachments/1085637890228371596/1137853910753759302/ONLY_RP.png' });
      
//               client.channels.cache.get('1092151812783612066').messages.fetch("1137832430108147842").then(msg => {
//                   msg.edit({embeds: [embed]});
//               });
//               c.end();
//             });
//           }
        

//           checkServerStatus();
//       })
//       .catch(error => {
//         if (error.code === "ECONNREFUSED") {
//             online = '🔴 Hors ligne'

//             const embed = new EmbedBuilder()
//             .setTitle('OnlyRP - Statut serveur')
//             .setColor('Purple')
//             .addFields(
//                 {
//                     "name": "> Connexion via F8",
//                     "value": "```\nconnect fivem.onlyrp.fr:30120\n```",
//                     "inline": false
//                 },
//                 {
//                     "name": "> OnlyRP",
//                     "value": `\`\`\`\n${online}\n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> Joueurs",
//                     "value": `\`\`\`\n${0} joueurs\n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> API CFX",
//                     "value": `\`\`\`\n${oo} \n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> Bot OnlyRP",
//                     "value": `\`\`\`\n${online} \n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> FiveM",
//                     "value": `\`\`\`\n${oo} \n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> Uptime",
//                     "value": `\`\`\`\n${"Indéfini"} \n\`\`\``,
//                     "inline": true
//                 },
//             )
//             .setFooter({ text: 'oBot 1.0.0 update toutes les 5 secondes • Today at ' + hours + ':' + minutes, iconURL: 'https://cdn.discordapp.com/attachments/1085637890228371596/1137853910753759302/ONLY_RP.png' });
    
//             client.channels.cache.get('1092151812783612066').messages.fetch("1137832430108147842").then(msg => {
//                 msg.edit({embeds: [embed]});
//             });
          
//         } else {
//             online = '🔴 Hors ligne'

//             const embed = new EmbedBuilder()
//             .setTitle('OnlyRP - Statut serveur')
//             .setColor('Purple')
//             .addFields(
//                 {
//                     "name": "> Connexion via F8",
//                     "value": "```\nconnect fivem.onlyrp.fr:30120\n```",
//                     "inline": false
//                 },
//                 {
//                     "name": "> OnlyRP",
//                     "value": `\`\`\`\n${online}\n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> Joueurs",
//                     "value": `\`\`\`\n${0} joueurs\n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> API CFX",
//                     "value": `\`\`\`\n${oo} \n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> Bot OnlyRP",
//                     "value": `\`\`\`\n${online} \n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> FiveM",
//                     "value": `\`\`\`\n${oo} \n\`\`\``,
//                     "inline": true
//                 },
//                 {
//                     "name": "> Uptime",
//                     "value": `\`\`\`\n${"Indéfini"} \n\`\`\``,
//                     "inline": true
//                 },
//             )
//             .setFooter({ text: 'oBot 1.0.0 update toutes les 5 secondes • Today at ' + hours + ':' + minutes, iconURL: 'https://cdn.discordapp.com/attachments/1085637890228371596/1137853910753759302/ONLY_RP.png' });
    
//             client.channels.cache.get('1092151812783612066').messages.fetch("1137832430108147842").then(msg => {
//                 msg.edit({embeds: [embed]});
//             });
//         }
//       });
//   } catch (error) {
//     console.log('Une exception s\'est produite :', error);
//   }
// }

// getPlayerCount();
// }

// client.on('ready', () => {
//     console.log('^6[oBot] ^0👑 oBot is launched')

//     const ticketEmbed = new EmbedBuilder()
//     .setColor('Purple')
//     .setTitle('oBot')
//     .setDescription(`Le bot a bien été setup sur le serveur et prêt à l'usage.\n\n👑  ${client.user.username} is launched in the server\n\n`)
//     .setFooter({ text: 'By Zmain', iconURL: 'https://cdn.discordapp.com/attachments/1085637890228371596/1137853910753759302/ONLY_RP.png' });

//     const statuses = [
//         () => `🌴 Only RP`,
//         () => 'son dev Galix',
//         () => `${client.guilds.cache.get('881983805064364112').members.guild.memberCount} sur discord`
//     ]
//     let i = 0
//     // try {
//     //     setInterval(() => {
//     //         try {
//     //             client.user.setActivity(statuses[i]());
//     //         } catch (error) {
//     //             console.log(error);
//     //         }
    
//     //         i = ++i % statuses.length
    
//     //     }, 5000);
//     // } catch (error) {
//     //     console.log(error);
//     // }

//     client.user.setActivity(statuses[i]());

//     client.user.setPresence({ status: 'idle' })

//     client.channels.cache.get('1092151859319423097').send({embeds: [ticketEmbed]})

//     try {
//         setInterval(() => {
//             ok()
    
//             i = ++i % statuses.length
    
//         }, 60000);
//     } catch (error) {
//         console.log(error);
//     }
// })

// client.on('messageCreate', message => {
//     const args = message.content.trim().split(/ +/);
//     const premierArgument = args.shift();
//     const deuxirgument = args.shift();
//     if (premierArgument === prefix + 'revive') {
//         const role = ['1092151789266161664']
//         if (!message.member.roles.cache.find(r => role.includes(r.id))) return message.reply({ content: 'Vous ne pouvez pas utiliser cette commande', ephemeral: true });

//         exports[GetCurrentResourceName()].reviveJS(deuxirgument)
//     }
// })

// client.on('messageCreate', message => {
//     const args = message.content.trim().split(/ +/);
//     const premierArgument = args.shift();
//     const deuxirgument = args.shift();
//     const trois = args.shift();
//     if (premierArgument === prefix + 'kick') {
//         const role = ['1092151789266161664']
//         if (!message.member.roles.cache.find(r => role.includes(r.id))) return message.reply({ content: 'Vous ne pouvez pas utiliser cette commande', ephemeral: true });

//         exports[GetCurrentResourceName()].kick(deuxirgument, trois)
//     }
// })

// client.login(config.token)