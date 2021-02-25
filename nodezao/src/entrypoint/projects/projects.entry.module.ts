import { Module } from '@nestjs/common';
import { ProjectsModule } from 'src/domain/projects/projects.module';
import { ProjectsController } from './projects.controller';

@Module({
    imports: [ProjectsModule],
    controllers: [ProjectsController],
})
export class ProjectsEModule {}
